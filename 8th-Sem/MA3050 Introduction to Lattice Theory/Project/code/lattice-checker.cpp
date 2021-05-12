#include <bits/stdc++.h>

using namespace std;

enum Color
{
    WHITE,
    GRAY,
    BLACK
};

class Lattice
{
    int V;
    vector<int> *adj;
    vector<int> topo;
    int **join;

    bool DFSUtil(int u, int color[])
    {
        color[u] = GRAY;

        vector<int>::iterator i;
        for (i = adj[u].begin(); i != adj[u].end(); ++i)
        {
            int v = *i;

            if (color[v] == GRAY)
                return true;

            if (color[v] == WHITE && DFSUtil(v, color))
                return true;
        }

        color[u] = BLACK;

        return false;
    }

    void topologicalSortUtil(int v, bool visited[], stack<int> &Stack)
    {
        visited[v] = true;

        vector<int>::iterator i;
        for (i = adj[v].begin(); i != adj[v].end(); ++i)
            if (!visited[*i])
                topologicalSortUtil(*i, visited, Stack);

        Stack.push(v);
    }

    void topologicalSort()
    {
        topo.clear();
        stack<int> Stack;

        bool *visited = new bool[V];
        for (int i = 0; i < V; i++)
            visited[i] = false;

        for (int i = 0; i < V; i++)
            if (visited[i] == false)
                topologicalSortUtil(i, visited, Stack);

        while (Stack.empty() == false)
        {
            topo.push_back(Stack.top());
            Stack.pop();
        }
        reverse(topo.begin(), topo.end());
    }

    bool checkJoins()
    {
        for (int i = 0; i < V; i++)
        {
            join[i][i] = i;
            join[i][V - 1] = V - 1;
            join[V - 1][i] = V - 1;
        }

        for (int i = 1; i < V; i++)
        {
            int x = topo[i];
            for (int j = 0; j < i; j++)
            {
                int y = topo[j];

                if (adj[x].empty())
                {
                    return false;
                }

                int a = join[adj[x][0]][y];

                for (int k = 1; k < adj[x].size(); k++)
                {
                    int u = adj[x][k];
                    if (join[join[y][u]][a] == a)
                    {
                        a = join[y][u];
                    }
                }

                for (int k = 0; k < adj[x].size(); k++)
                {
                    int u = adj[x][k];
                    if (!(join[a][join[y][u]] == join[y][u]))
                    {
                        return false;
                    }
                }

                join[x][y] = a;
                join[y][x] = a;
            }
        }

        return true;
    }

    bool checkGlobalExtremes()
    {
        bool arrmin[V];
        bool arrmax[V];

        for (int i = 0; i < V; i++)
        {
            arrmin[i] = false;
            arrmax[i] = false;
        }

        arrmax[topo[0]] = true;
        for (int i = 1; i < V; i++)
        {
            int u = topo[i];
            for (int v : adj[u])
            {
                if (arrmax[v] == true)
                {
                    arrmax[u] = true;
                    break;
                }
            }
        }

        queue<int> q;
        q.push(topo[V - 1]);
        while (!q.empty())
        {
            int u = q.front();
            q.pop();
            arrmin[u] = true;
            for (int v : adj[u])
            {
                if (!arrmin[v])
                {
                    q.push(v);
                }
            }
        }

        bool flag = true;
        for (int i = 0; i < V; i++)
        {
            flag = flag and arrmin[i];
            flag = flag and arrmax[i];
        }

        return flag;
    }

public:
    Lattice(int V)
    {
        this->V = V;
        adj = new vector<int>[V];
        join = new int *[V];
        for (int i = 0; i < V; i++)
        {
            join[i] = new int[V];
        }
        for (int i = 0; i < V; i++)
        {
            for (int j = 0; j < V; j++)
            {
                join[i][j] = -1;
            }
        }
    }

    void addEdge(int v, int w)
    {
        adj[v].push_back(w);
    }

    bool isEdge(int v, int u)
    {
        for (int x : adj[v])
        {
            if (x == u)
            {
                return true;
            }
        }
        return false;
    }

    bool isCyclic()
    {
        int *color = new int[V];
        for (int i = 0; i < V; i++)
            color[i] = WHITE;

        for (int i = 0; i < V; i++)
            if (color[i] == WHITE)
                if (DFSUtil(i, color) == true)
                    return true;

        return false;
    }

    bool isLattice()
    {
        if (isCyclic())
        {
            return false;
        }

        topologicalSort();

        if (V == 1)
        {
            return true;
        }

        if (!checkGlobalExtremes())
        {
            return false;
        }
        
        return checkJoins();
    }

    void displayLattice()
    {
        ofstream img("image.dot");
        img << "// View graph online on https://dreampuf.github.io/GraphvizOnline/" << endl;

        img << "digraph G {\n";
        img << "rankdir=BT;" << endl;
        for (int u = 0; u < V; u++)
        {
            if (adj[u].size() == 0)
            {
                img  << "  " << u << ";\n";
            }
            for (auto v : adj[u])
            {
                img << "  " << u << " -> " << v << ";\n";
            }
        }
        img << "}";
        img.close();
    }
};

int main()
{
    int n;
    cin >> n;
    Lattice L(n);
    int a, b;
    while(cin >> a >> b)
    {
        assert(a >= 0 and a < n and b >= 0 and b < n);
        L.addEdge(a, b);
    }
    L.displayLattice();
    if (L.isLattice())
    {
        cout << "Graph is a lattice.\n";
    }
    else
    {
        cout << "Graph is not a lattice.\n";
    }

    return 0;
}