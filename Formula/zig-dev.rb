class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "4c9c5f5ec7500666b89b928ca8be195e118d73a465ddfac317ac76c4b9043fd8" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "ba4a8eb24d4409c66d9cc79aa64f90a3cc3f8bafe218e2c0458ee8197d8be6a7" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "567097a8586fc370592dbfa046f241166581144aeeb1cf880a576f0f792cde8a" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3002+9d7082972.tar.xz"
  version "0.12.0-dev.3002+9d7082972"
  license "MIT"

  livecheck do
    skip "Dynamic `url` and `sha256`"
  end

  depends_on macos: :big_sur # https://github.com/ziglang/zig/issues/13313
  depends_on "z3"
  depends_on "zstd"
  uses_from_macos "ncurses"
  uses_from_macos "zlib"

  conflicts_with "zig", because: "both install a `zig` binary"

  def install
    bin.install "zig"
    lib.install "lib" => "zig"
  end
end
