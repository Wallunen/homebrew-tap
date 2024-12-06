class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "6c21dd5f4511c010d7790568ec9bed597e43a71ddc479eed5c82e9b9287ff6aa" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "51c99141a402ec5f08730f64fa8f3710b5003552729856ae05726c401a7e493a" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "510e004eff5d138f77f2cffa0ac0b7a6d64871fe0c5ea90bba94e63e1f5a6967" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2384+cbc05e0b1.tar.xz"
  version "0.14.0-dev.2384+cbc05e0b1"
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
