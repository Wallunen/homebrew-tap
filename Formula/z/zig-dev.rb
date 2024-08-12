class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "a98d3a8f53be1a0815634f3bd9175e76d4edb8d3e907f61ddd1e93b0cb6c916f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e924a274bcc8e4ec63b7e8bbbf429669bbaf4972505017609c3b54bd96e03d9b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "43c483b66205860ec64a277e7c6b8c503515bfc23e731c55bb181b3c565e6ad9" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1018+531cd177e.tar.xz"
  version "0.14.0-dev.1018+531cd177e"
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
