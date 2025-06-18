#include <linux/build-salt.h>
#include <linux/module.h>
#include <linux/vermagic.h>
#include <linux/compiler.h>

BUILD_SALT;

MODULE_INFO(vermagic, VERMAGIC_STRING);
MODULE_INFO(name, KBUILD_MODNAME);

__visible struct module __this_module
__section(.gnu.linkonce.this_module) = {
	.name = KBUILD_MODNAME,
	.init = init_module,
#ifdef CONFIG_MODULE_UNLOAD
	.exit = cleanup_module,
#endif
	.arch = MODULE_ARCH_INIT,
};

#ifdef CONFIG_RETPOLINE
MODULE_INFO(retpoline, "Y");
#endif

static const struct modversion_info ____versions[]
__used __section(__versions) = {
	{ 0xd157aae5, "module_layout" },
	{ 0xc1514a3b, "free_irq" },
	{ 0xedc03953, "iounmap" },
	{ 0x213cf1e8, "class_destroy" },
	{ 0x719617d5, "device_destroy" },
	{ 0x6091b333, "unregister_chrdev_region" },
	{ 0x257fbbe6, "cdev_del" },
	{ 0x92d5838e, "request_threaded_irq" },
	{ 0x17035511, "irq_of_parse_and_map" },
	{ 0xe97c4103, "ioremap" },
	{ 0x20eee97e, "of_find_node_opts_by_path" },
	{ 0x4269ee2a, "device_create" },
	{ 0x4db2b896, "__class_create" },
	{ 0xe1efc9d2, "cdev_add" },
	{ 0x5c9db7ae, "cdev_init" },
	{ 0xe3ec2f2b, "alloc_chrdev_region" },
	{ 0xf9a482f9, "msleep" },
	{ 0x822137e2, "arm_heavy_mb" },
	{ 0xdecd0b29, "__stack_chk_fail" },
	{ 0x8f678b07, "__stack_chk_guard" },
	{ 0x51a910c0, "arm_copy_to_user" },
	{ 0x5f754e5a, "memset" },
	{ 0xae353d77, "arm_copy_from_user" },
	{ 0x10535e3d, "nonseekable_open" },
	{ 0xc5850110, "printk" },
	{ 0xefd6cf06, "__aeabi_unwind_cpp_pr0" },
};

MODULE_INFO(depends, "");

