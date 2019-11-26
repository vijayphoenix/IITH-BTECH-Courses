	.text
	.file	"factorial.cpp"
	.globl	_Z9factoriali           # -- Begin function _Z9factoriali
	.p2align	4, 0x90
	.type	_Z9factoriali,@function
_Z9factoriali:                          # @_Z9factoriali
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	%edi, -12(%rbp)
	cmpl	$1, -12(%rbp)
	je	.LBB0_2
# %bb.1:                                # %lor.lhs.false
	cmpl	$0, -12(%rbp)
	jne	.LBB0_3
.LBB0_2:                                # %if.then
	movq	$1, -8(%rbp)
	jmp	.LBB0_4
.LBB0_3:                                # %if.end
	movslq	-12(%rbp), %rax
	movl	-12(%rbp), %ecx
	subl	$1, %ecx
	movl	%ecx, %edi
	movq	%rax, -24(%rbp)         # 8-byte Spill
	callq	_Z9factoriali
	movq	-24(%rbp), %rdx         # 8-byte Reload
	imulq	%rax, %rdx
	movq	%rdx, -8(%rbp)
.LBB0_4:                                # %return
	movq	-8(%rbp), %rax
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	_Z9factoriali, .Lfunc_end0-_Z9factoriali
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
	subq	$16, %rsp
	movl	$0, -4(%rbp)
	movl	$10, %edi
	callq	_Z9factoriali
	xorl	%ecx, %ecx
	movq	%rax, -16(%rbp)         # 8-byte Spill
	movl	%ecx, %eax
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 10.0.0 (https://github.com/llvm/llvm-project.git 028b5499fffa536236cb5714e6d14b786883a4b4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym _Z9factoriali
