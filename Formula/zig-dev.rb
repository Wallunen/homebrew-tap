class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "9333bda4c55479b8e8a8f77107b427741611a92293fb784a9bc6c6f6798b3d2a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "8c0f966c2b7502ad0c91a4864e96d5df28c3e77069e67155ccadef1db7e23f1d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "f693517b59fe5b34c5b10f03e7129c780a43de01c5aaf29a9b0238c724b5c124" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1184+3f4df8529.tar.xz"
  version "0.12.0-dev.1184+3f4df8529"
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
