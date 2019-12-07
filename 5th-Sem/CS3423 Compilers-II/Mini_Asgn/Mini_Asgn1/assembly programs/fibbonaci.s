	.text
	.file	"fibbonaci.cpp"
	.globl	_Z3fibi                 # -- Begin function _Z3fibi
	.p2align	4, 0x90
	.type	_Z3fibi,@function
_Z3fibi:                                # @_Z3fibi
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	%edi, -12(%rbp)
	movq	$0, -24(%rbp)
	movq	$1, -32(%rbp)
	cmpl	$0, -12(%rbp)
	jne	.LBB0_2
# %bb.1:                                # %if.then
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	.LBB0_7
.LBB0_2:                                # %if.end
	movl	$2, -44(%rbp)
.LBB0_3:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	-44(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jg	.LBB0_6
# %bb.4:                                # %for.body
                                        #   in Loop: Header=BB0_3 Depth=1
	movq	-24(%rbp), %rax
	addq	-32(%rbp), %rax
	movq	%rax, -40(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -32(%rbp)
# %bb.5:                                # %for.inc
                                        #   in Loop: Header=BB0_3 Depth=1
	movl	-44(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -44(%rbp)
	jmp	.LBB0_3
.LBB0_6:                                # %for.end
	movq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
.LBB0_7:                                # %return
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	_Z3fibi, .Lfunc_end0-_Z3fibi
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
	callq	_Z3fibi
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
	.addrsig_sym _Z3fibi
