	.text
	.file	"MergeSort.cpp"
	.globl	_Z9mergesortPiii        # -- Begin function _Z9mergesortPiii
	.p2align	4, 0x90
	.type	_Z9mergesortPiii,@function
_Z9mergesortPiii:                       # @_Z9mergesortPiii
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$80, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -16(%rbp)
	movl	-12(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jge	.LBB0_20
# %bb.1:                                # %if.then
	movl	-12(%rbp), %eax
	movl	-16(%rbp), %ecx
	subl	%eax, %ecx
	movl	%ecx, %edx
	shrl	$31, %edx
	addl	%edx, %ecx
	sarl	%ecx
	addl	%ecx, %eax
	movl	%eax, -20(%rbp)
	movq	-8(%rbp), %rdi
	movl	-12(%rbp), %esi
	movl	-20(%rbp), %edx
	callq	_Z9mergesortPiii
	movq	-8(%rbp), %rdi
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	-16(%rbp), %edx
	movl	%eax, %esi
	callq	_Z9mergesortPiii
	movl	-16(%rbp), %eax
	movl	-12(%rbp), %ecx
	subl	%ecx, %eax
	addl	$1, %eax
	movl	%eax, %edi
	movq	%rsp, %r8
	movq	%r8, -32(%rbp)
	leaq	15(,%rdi,4), %r8
	andq	$-16, %r8
	movq	%rsp, %r9
	subq	%r8, %r9
	movq	%r9, %rsp
	movq	%rdi, -40(%rbp)
	movl	-12(%rbp), %eax
	movl	%eax, -44(%rbp)
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -48(%rbp)
	movl	$0, -52(%rbp)
	movq	%r9, -64(%rbp)          # 8-byte Spill
.LBB0_2:                                # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	-44(%rbp), %eax
	cmpl	-20(%rbp), %eax
	movb	$1, %cl
	movb	%cl, -65(%rbp)          # 1-byte Spill
	jle	.LBB0_4
# %bb.3:                                # %lor.rhs
                                        #   in Loop: Header=BB0_2 Depth=1
	movl	-48(%rbp), %eax
	cmpl	-16(%rbp), %eax
	setle	%cl
	movb	%cl, -65(%rbp)          # 1-byte Spill
.LBB0_4:                                # %lor.end
                                        #   in Loop: Header=BB0_2 Depth=1
	movb	-65(%rbp), %al          # 1-byte Reload
	testb	$1, %al
	jne	.LBB0_5
	jmp	.LBB0_15
.LBB0_5:                                # %while.body
                                        #   in Loop: Header=BB0_2 Depth=1
	movl	-48(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jg	.LBB0_9
# %bb.6:                                # %land.lhs.true
                                        #   in Loop: Header=BB0_2 Depth=1
	movl	-44(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jg	.LBB0_8
# %bb.7:                                # %lor.lhs.false
                                        #   in Loop: Header=BB0_2 Depth=1
	movq	-8(%rbp), %rax
	movslq	-48(%rbp), %rcx
	movl	(%rax,%rcx,4), %edx
	movq	-8(%rbp), %rax
	movslq	-44(%rbp), %rcx
	cmpl	(%rax,%rcx,4), %edx
	jge	.LBB0_9
.LBB0_8:                                # %if.then12
                                        #   in Loop: Header=BB0_2 Depth=1
	movq	-8(%rbp), %rax
	movslq	-48(%rbp), %rcx
	movl	(%rax,%rcx,4), %edx
	movslq	-52(%rbp), %rax
	movq	-64(%rbp), %rcx         # 8-byte Reload
	movl	%edx, (%rcx,%rax,4)
	movl	-48(%rbp), %edx
	addl	$1, %edx
	movl	%edx, -48(%rbp)
	jmp	.LBB0_14
.LBB0_9:                                # %if.else
                                        #   in Loop: Header=BB0_2 Depth=1
	movl	-44(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jg	.LBB0_13
# %bb.10:                               # %land.lhs.true18
                                        #   in Loop: Header=BB0_2 Depth=1
	movl	-48(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jg	.LBB0_12
# %bb.11:                               # %lor.lhs.false20
                                        #   in Loop: Header=BB0_2 Depth=1
	movq	-8(%rbp), %rax
	movslq	-48(%rbp), %rcx
	movl	(%rax,%rcx,4), %edx
	movq	-8(%rbp), %rax
	movslq	-44(%rbp), %rcx
	cmpl	(%rax,%rcx,4), %edx
	jl	.LBB0_13
.LBB0_12:                               # %if.then26
                                        #   in Loop: Header=BB0_2 Depth=1
	movq	-8(%rbp), %rax
	movslq	-44(%rbp), %rcx
	movl	(%rax,%rcx,4), %edx
	movslq	-52(%rbp), %rax
	movq	-64(%rbp), %rcx         # 8-byte Reload
	movl	%edx, (%rcx,%rax,4)
	movl	-44(%rbp), %edx
	addl	$1, %edx
	movl	%edx, -44(%rbp)
.LBB0_13:                               # %if.end
                                        #   in Loop: Header=BB0_2 Depth=1
	jmp	.LBB0_14
.LBB0_14:                               # %if.end32
                                        #   in Loop: Header=BB0_2 Depth=1
	movl	-52(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -52(%rbp)
	jmp	.LBB0_2
.LBB0_15:                               # %while.end
	movl	-12(%rbp), %eax
	movl	%eax, -44(%rbp)
.LBB0_16:                               # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	-44(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jg	.LBB0_19
# %bb.17:                               # %for.body
                                        #   in Loop: Header=BB0_16 Depth=1
	movl	-44(%rbp), %eax
	subl	-12(%rbp), %eax
	movslq	%eax, %rcx
	movq	-64(%rbp), %rdx         # 8-byte Reload
	movl	(%rdx,%rcx,4), %eax
	movq	-8(%rbp), %rcx
	movslq	-44(%rbp), %rsi
	movl	%eax, (%rcx,%rsi,4)
# %bb.18:                               # %for.inc
                                        #   in Loop: Header=BB0_16 Depth=1
	movl	-44(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -44(%rbp)
	jmp	.LBB0_16
.LBB0_19:                               # %for.end
	movq	-32(%rbp), %rax
	movq	%rax, %rsp
.LBB0_20:                               # %if.end41
	movq	%rbp, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	_Z9mergesortPiii, .Lfunc_end0-_Z9mergesortPiii
	.cfi_endproc
                                        # -- End function
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	xorl	%esi, %esi
	leaq	-32(%rbp), %rdi
	movl	$0, -4(%rbp)
	movq	.L__const.main.a, %rax
	movq	%rax, -32(%rbp)
	movq	.L__const.main.a+8, %rax
	movq	%rax, -24(%rbp)
	movl	$3, %edx
	callq	_Z9mergesortPiii
	xorl	%eax, %eax
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.type	.L__const.main.a,@object # @__const.main.a
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.L__const.main.a:
	.long	10                      # 0xa
	.long	5                       # 0x5
	.long	100                     # 0x64
	.long	4                       # 0x4
	.size	.L__const.main.a, 16


	.ident	"clang version 10.0.0 (https://github.com/llvm/llvm-project.git 028b5499fffa536236cb5714e6d14b786883a4b4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym _Z9mergesortPiii
