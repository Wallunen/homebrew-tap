class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "acca95f9d81dc107d5bd3af96af9765546454c00aae3d566b1752579dc9a2ee6" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "924d90290689380f802212bf9a775fcc9ad0de0886d2bf945ed560016aea0db7" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "5576440040a54f2931a22a26089d5675ea3b1bec007f387da2aff57ce2463c46" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.184+bf588f67d.tar.xz"
  version "0.14.0-dev.184+bf588f67d"
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
