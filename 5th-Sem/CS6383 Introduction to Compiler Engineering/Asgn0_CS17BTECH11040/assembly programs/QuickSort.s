	.text
	.file	"QuickSort.cpp"
	.globl	_Z4SWAPPiS_             # -- Begin function _Z4SWAPPiS_
	.p2align	4, 0x90
	.type	_Z4SWAPPiS_,@function
_Z4SWAPPiS_:                            # @_Z4SWAPPiS_
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	movl	(%rax), %ecx
	movl	%ecx, -20(%rbp)
	movq	-16(%rbp), %rax
	movl	(%rax), %ecx
	movq	-8(%rbp), %rax
	movl	%ecx, (%rax)
	movl	-20(%rbp), %ecx
	movq	-16(%rbp), %rax
	movl	%ecx, (%rax)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	_Z4SWAPPiS_, .Lfunc_end0-_Z4SWAPPiS_
	.cfi_endproc
                                        # -- End function
	.globl	_Z9quicksortPiii        # -- Begin function _Z9quicksortPiii
	.p2align	4, 0x90
	.type	_Z9quicksortPiii,@function
_Z9quicksortPiii:                       # @_Z9quicksortPiii
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -16(%rbp)
	movl	-12(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jge	.LBB1_17
# %bb.1:                                # %if.then
	movl	-12(%rbp), %eax
	movl	%eax, -20(%rbp)
	movl	-16(%rbp), %eax
	movl	%eax, -24(%rbp)
.LBB1_2:                                # %while.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_4 Depth 2
                                        #     Child Loop BB1_9 Depth 2
	movl	-20(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jge	.LBB1_16
# %bb.3:                                # %while.body
                                        #   in Loop: Header=BB1_2 Depth=1
	jmp	.LBB1_4
.LBB1_4:                                # %while.cond2
                                        #   Parent Loop BB1_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
	movq	-8(%rbp), %rcx
	movslq	-20(%rbp), %rdx
	movl	(%rcx,%rdx,4), %esi
	movq	-8(%rbp), %rcx
	movslq	-12(%rbp), %rdx
	cmpl	(%rcx,%rdx,4), %esi
	movb	%al, -25(%rbp)          # 1-byte Spill
	jg	.LBB1_6
# %bb.5:                                # %land.rhs
                                        #   in Loop: Header=BB1_4 Depth=2
	movl	-20(%rbp), %eax
	cmpl	-24(%rbp), %eax
	setle	%cl
	movb	%cl, -25(%rbp)          # 1-byte Spill
.LBB1_6:                                # %land.end
                                        #   in Loop: Header=BB1_4 Depth=2
	movb	-25(%rbp), %al          # 1-byte Reload
	testb	$1, %al
	jne	.LBB1_7
	jmp	.LBB1_8
.LBB1_7:                                # %while.body7
                                        #   in Loop: Header=BB1_4 Depth=2
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	jmp	.LBB1_4
.LBB1_8:                                # %while.end
                                        #   in Loop: Header=BB1_2 Depth=1
	jmp	.LBB1_9
.LBB1_9:                                # %while.cond8
                                        #   Parent Loop BB1_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
	movq	-8(%rbp), %rcx
	movslq	-24(%rbp), %rdx
	movl	(%rcx,%rdx,4), %esi
	movq	-8(%rbp), %rcx
	movslq	-12(%rbp), %rdx
	cmpl	(%rcx,%rdx,4), %esi
	movb	%al, -26(%rbp)          # 1-byte Spill
	jl	.LBB1_11
# %bb.10:                               # %land.rhs14
                                        #   in Loop: Header=BB1_9 Depth=2
	movl	-24(%rbp), %eax
	cmpl	-20(%rbp), %eax
	setge	%cl
	movb	%cl, -26(%rbp)          # 1-byte Spill
.LBB1_11:                               # %land.end16
                                        #   in Loop: Header=BB1_9 Depth=2
	movb	-26(%rbp), %al          # 1-byte Reload
	testb	$1, %al
	jne	.LBB1_12
	jmp	.LBB1_13
.LBB1_12:                               # %while.body17
                                        #   in Loop: Header=BB1_9 Depth=2
	movl	-24(%rbp), %eax
	addl	$-1, %eax
	movl	%eax, -24(%rbp)
	jmp	.LBB1_9
.LBB1_13:                               # %while.end18
                                        #   in Loop: Header=BB1_2 Depth=1
	movl	-20(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jge	.LBB1_15
# %bb.14:                               # %if.then20
                                        #   in Loop: Header=BB1_2 Depth=1
	movq	-8(%rbp), %rax
	movslq	-20(%rbp), %rcx
	shlq	$2, %rcx
	addq	%rcx, %rax
	movq	-8(%rbp), %rcx
	movslq	-24(%rbp), %rdx
	shlq	$2, %rdx
	addq	%rdx, %rcx
	movq	%rax, %rdi
	movq	%rcx, %rsi
	callq	_Z4SWAPPiS_
.LBB1_15:                               # %if.end
                                        #   in Loop: Header=BB1_2 Depth=1
	jmp	.LBB1_2
.LBB1_16:                               # %while.end25
	movq	-8(%rbp), %rax
	movslq	-12(%rbp), %rcx
	shlq	$2, %rcx
	addq	%rcx, %rax
	movq	-8(%rbp), %rcx
	movslq	-24(%rbp), %rdx
	shlq	$2, %rdx
	addq	%rdx, %rcx
	movq	%rax, %rdi
	movq	%rcx, %rsi
	callq	_Z4SWAPPiS_
	movq	-8(%rbp), %rdi
	movl	-12(%rbp), %esi
	movl	-24(%rbp), %r8d
	subl	$1, %r8d
	movl	%r8d, %edx
	callq	_Z9quicksortPiii
	movq	-8(%rbp), %rdi
	movl	-24(%rbp), %edx
	addl	$1, %edx
	movl	-16(%rbp), %esi
	movl	%esi, -32(%rbp)         # 4-byte Spill
	movl	%edx, %esi
	movl	-32(%rbp), %edx         # 4-byte Reload
	callq	_Z9quicksortPiii
.LBB1_17:                               # %if.end30
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	_Z9quicksortPiii, .Lfunc_end1-_Z9quicksortPiii
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
	callq	_Z9quicksortPiii
	xorl	%eax, %eax
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end2:
	.size	main, .Lfunc_end2-main
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
	.addrsig_sym _Z4SWAPPiS_
	.addrsig_sym _Z9quicksortPiii
