	.text
	.file	"palindrome.cpp"
	.section	.text.startup,"ax",@progbits
	.p2align	4, 0x90         # -- Begin function __cxx_global_var_init
	.type	__cxx_global_var_init,@function
__cxx_global_var_init:                  # @__cxx_global_var_init
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movabsq	$_ZStL8__ioinit, %rdi
	callq	_ZNSt8ios_base4InitC1Ev
	movabsq	$_ZNSt8ios_base4InitD1Ev, %rax
	movq	%rax, %rdi
	movabsq	$_ZStL8__ioinit, %rsi
	movabsq	$__dso_handle, %rdx
	callq	__cxa_atexit
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	__cxx_global_var_init, .Lfunc_end0-__cxx_global_var_init
	.cfi_endproc
                                        # -- End function
	.text
	.globl	_Z16check_palindromePci # -- Begin function _Z16check_palindromePci
	.p2align	4, 0x90
	.type	_Z16check_palindromePci,@function
_Z16check_palindromePci:                # @_Z16check_palindromePci
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -16(%rbp)
	movl	%esi, -20(%rbp)
	cmpl	$0, -20(%rbp)
	je	.LBB1_2
# %bb.1:                                # %lor.lhs.false
	cmpl	$1, -20(%rbp)
	jne	.LBB1_3
.LBB1_2:                                # %if.then
	movb	$1, -1(%rbp)
	jmp	.LBB1_10
.LBB1_3:                                # %if.end
	movl	$0, -24(%rbp)
.LBB1_4:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	-24(%rbp), %eax
	movl	-20(%rbp), %ecx
	movl	%eax, -28(%rbp)         # 4-byte Spill
	movl	%ecx, %eax
	cltd
	movl	$2, %ecx
	idivl	%ecx
	movl	-28(%rbp), %ecx         # 4-byte Reload
	cmpl	%eax, %ecx
	jg	.LBB1_9
# %bb.5:                                # %for.body
                                        #   in Loop: Header=BB1_4 Depth=1
	movq	-16(%rbp), %rax
	movslq	-24(%rbp), %rcx
	movsbl	(%rax,%rcx), %edx
	movq	-16(%rbp), %rax
	movl	-20(%rbp), %esi
	subl	-24(%rbp), %esi
	subl	$1, %esi
	movslq	%esi, %rcx
	movsbl	(%rax,%rcx), %esi
	cmpl	%esi, %edx
	je	.LBB1_7
# %bb.6:                                # %if.then8
	movb	$0, -1(%rbp)
	jmp	.LBB1_10
.LBB1_7:                                # %if.end9
                                        #   in Loop: Header=BB1_4 Depth=1
	jmp	.LBB1_8
.LBB1_8:                                # %for.inc
                                        #   in Loop: Header=BB1_4 Depth=1
	movl	-24(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -24(%rbp)
	jmp	.LBB1_4
.LBB1_9:                                # %for.end
	movb	$1, -1(%rbp)
.LBB1_10:                               # %return
	movb	-1(%rbp), %al
	andb	$1, %al
	movzbl	%al, %eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	_Z16check_palindromePci, .Lfunc_end1-_Z16check_palindromePci
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
	leaq	-10(%rbp), %rdi
	movq	.L__const.main.s, %rax
	movq	%rax, -10(%rbp)
	movw	.L__const.main.s+8, %cx
	movw	%cx, -2(%rbp)
	movl	$9, %esi
	callq	_Z16check_palindromePci
	xorl	%edx, %edx
	movb	%al, -11(%rbp)          # 1-byte Spill
	movl	%edx, %eax
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end2:
	.size	main, .Lfunc_end2-main
	.cfi_endproc
                                        # -- End function
	.section	.text.startup,"ax",@progbits
	.p2align	4, 0x90         # -- Begin function _GLOBAL__sub_I_palindrome.cpp
	.type	_GLOBAL__sub_I_palindrome.cpp,@function
_GLOBAL__sub_I_palindrome.cpp:          # @_GLOBAL__sub_I_palindrome.cpp
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	callq	__cxx_global_var_init
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end3:
	.size	_GLOBAL__sub_I_palindrome.cpp, .Lfunc_end3-_GLOBAL__sub_I_palindrome.cpp
	.cfi_endproc
                                        # -- End function
	.type	_ZStL8__ioinit,@object  # @_ZStL8__ioinit
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.hidden	__dso_handle
	.type	.L__const.main.s,@object # @__const.main.s
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__const.main.s:
	.asciz	"aaabbbaaa"
	.size	.L__const.main.s, 10

	.section	.init_array,"aw",@init_array
	.p2align	3
	.quad	_GLOBAL__sub_I_palindrome.cpp

	.ident	"clang version 10.0.0 (https://github.com/llvm/llvm-project.git 028b5499fffa536236cb5714e6d14b786883a4b4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym __cxx_global_var_init
	.addrsig_sym __cxa_atexit
	.addrsig_sym _Z16check_palindromePci
	.addrsig_sym _GLOBAL__sub_I_palindrome.cpp
	.addrsig_sym _ZStL8__ioinit
	.addrsig_sym __dso_handle
