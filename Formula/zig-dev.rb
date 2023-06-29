class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "2ef001b7d8c45ebd78fde34266e231a446bbfc1d631e2d6145744f866da46268" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "da80275bed2a44973af26408dba7e85af586c3230f66ab58d62806ec8b514b6c" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e1837a36283d33e74a12c3432e3d9eb39ef74b806eb0cb7c0009c07e0114febe" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3883+7166407d8.tar.xz"
  version "0.11.0-dev.3883+7166407d8"
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
