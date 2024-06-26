; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=riscv32-- | FileCheck %s
; RUN: llc < %s -mtriple=riscv64-- | FileCheck %s

define i32 @PR94145(i16 %a0) {
; CHECK-LABEL: PR94145:
; CHECK:       # %bb.0:
; CHECK-NEXT:    andi a0, a0, 2
; CHECK-NEXT:    seqz a0, a0
; CHECK-NEXT:    li a1, 1
; CHECK-NEXT:    sll a0, a1, a0
; CHECK-NEXT:    ret
  %lshr = lshr i16 %a0, 1
  %and = and i16 %lshr, 1
  %xor = xor i16 %and, 1
  %shl = shl i16 1, %xor
  %freeze = freeze i16 %shl
  %zext = zext i16 %freeze to i32
  ret i32 %zext
}
