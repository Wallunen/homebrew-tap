class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260501-092815"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "b9efcd2627e6b84c38be7fe827ff59ddd2b65911fe41a164aee30e124ef9631d"
    sha256 cellar: :any_skip_relocation, sequoia:      "008f17025cf54224fe51799737aaa4f6508170e6f3d85c6c3b252513702457ea"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a7a03c624e4587cd6a96fa88362349fa88c48a18a9dc0612b2bb29fdf489d445"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "67ed4b68d6c91ed26f0a76837bdb9067b5da97cdc288a6cb04bb6986d601693a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "d9c3bb453b637e3f49da52404f71bf0ccc0d082e480e80c6bc534e2c42637bb9" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "a90bb6c69b4b48ac1d50e4a41af67ca2e479fd7e62382705643f2132d3bcda03" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.224+c166c49b1.tar.xz"
  version "0.17.0-dev.224+c166c49b1"
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
