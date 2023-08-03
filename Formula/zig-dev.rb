class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "fb04bbf139e822078a452ec04dbcb6c4fa2a5453c3b8ceb4e00cf675b12edada" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "db0f16566334f49b6409b22f133d3ba257e06d41216e8b7d3d4b5796f43c09f8" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "2c220e5c34fb9b07f5a7bd95811b141ef09bf7fd5a6e0198d573ba9d36a0afd4" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.4407+4d7dd1689.tar.xz"
  version "0.11.0-dev.4407+4d7dd1689"
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
