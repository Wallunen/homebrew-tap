class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "7764f5ab6120cd07bcfebf5966fdf12daa29a5f7c042ec67a2e3a5883a1c610a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "980f0684bc8da4d24f1a81abbf8f0a6e46d47eb58e1c69c0b056b30c4af2c761" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "0c691ad2195861f11f88d50dbe6c0851e38a123fc44b3b8dc40e1a3b69db22e2" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.82+2ceeade99.tar.xz"
  version "0.12.0-dev.82+2ceeade99"
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
