.section ".text.boot"

.global _start

_start:
    mrs x1, mpidr_el1
    and x1, x1, #3
    cbz x1, 2f
1:  wfe
    b 1b
    // set stack before our code
2:  ldr     x1, =_start
    mov     sp, x1
    bl      main
    b       .
