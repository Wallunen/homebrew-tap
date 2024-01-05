class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "9f14829c774022ba3b2f33fe0dab899955d54d7f76d575f63dc8e867af40ad10" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "bbd9c455f825510390e5dd0902a0fea9cf1646cd6c8697e0ae8ea77cbea85eab" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "fd48f32890435039042a5f9e85a1a1e71f2299ba41387a77a3192904d89cd607" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2046+d3a163f86.tar.xz"
  version "0.12.0-dev.2046+d3a163f86"
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
