class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "ea4f11ac5eab7c7749bc40bdbf7866128a216f189ed77fa45c8eb806e6629116" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "5cae6dfd9e49b82292ccad86ef1042fa21fe52912a7ce32882b66df2d8ee4483" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "01d745b7e34d96a9ea9f97e44ace431b3463baedd65b2c5a11419b84d7a0df74" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.4228+aea29afc4.tar.xz"
  version "0.11.0-dev.4228+aea29afc4"
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
