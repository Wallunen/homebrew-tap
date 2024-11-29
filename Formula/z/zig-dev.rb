class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "ca1407996df46aafe2a8862e3648826f1ce8033318399095818b3fbdd8ef4d1f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "5b19119fee7a83d4cef45e0534882fce86d0a65e7e2e38e90faadee96eea4f5d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "7fbb79b38f0af36f0a4dca08815c5af1ce7c9854c7c934b4cf3e9b3e5dad509f" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2335+8594f179f.tar.xz"
  version "0.14.0-dev.2335+8594f179f"
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
