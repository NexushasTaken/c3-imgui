module target;
import std::io;

fn void main(String[] args) {
  if (env::ARCH_64_BIT) {
    if (env::FREEBSD) {
      io::printn("freebsd-x64");
      return;
    } else if (env::NETBSD) {
      io::printn("netbsd-x64");
      return;
    } else if (env::OPENBSD) {
      io::printn("penbsd-x64");
      return;
    }
  }

  if (env::LINUX) {
    if (env::AARCH64) {
      io::printn("linux-aarch64");
      return;
    } else if (env::ARCH_TYPE == ArchType.RISCV32) {
      io::printn("linux-riscv32");
      return;
    } else if (env::ARCH_TYPE == ArchType.RISCV64) {
      io::printn("linux-riscv64");
      return;
    } else if (env::ARCH_32_BIT) {
      io::printn("linux-x32");
      return;
    } else if (env::ARCH_64_BIT) {
      io::printn("linux-x64");
      return;
    }
  }
  if (env::OS_TYPE == OsType.MACOS) {
    if (env::ARCH_TYPE == ArchType.AARCH64) {
      io::printn("macos-aarch64");
      return;
    } else if (env::ARCH_64_BIT) {
      io::printn("macos-x64");
      return;
    }
  }

  if (env::WASM_NOLIBC) {
    if (env::ARCH_64_BIT) {
      io::printn("wasm-x64");
    } else {
      io::printn("wasm-x32");
    }
    return;
  }

  // Windows
  if (env::ARCH_64_BIT) {
    io::printn("windows-x64");
  } else if (env::AARCH64) {
    io::printn("windows-arch64");
  }
}
