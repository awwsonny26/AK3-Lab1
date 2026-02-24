.syntax unified
.cpu cortex-m4
.thumb

.global vtable
.global reset_handler

// Таблиця векторів: SP і Reset
.type vtable, %object
vtable:
  .word __stack_start // Старт стека
  .word __hard_reset__+1 // Reset у Thumb
.size vtable, .-vtable

__hard_reset__:
  ldr r0, =__stack_start // Адреса стека
  mov sp, r0 // SP = stack
  b __hard_reset__ // Цикл

