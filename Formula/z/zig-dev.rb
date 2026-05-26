class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260525-114850"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "fdcc55df38d8fea3769280e2d10b767f7692207cbe76d9cbb9e3b3d87a9a33c8"
    sha256 cellar: :any_skip_relocation, sequoia:      "ef8d65e2b436c295a9756aa2a87a916394306aee5949a9a31d4d6a4deafbe689"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0363c3037769d0d507baecaafb57d032acf901fa3dff82802f00a300d0929b4c"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d2f4dc47c528062473234f7d380a999ed2227172e2b352c53b4301edd990e713" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "ffd4102c5f909f806cfb137b7cb6599d3ad8476ce800dad99a6d3f9a8b2883c4" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "878101f0247e1084cef831101b8ed6466ac3d01f589d496390b61d1bb0635aab" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.356+3140b375f.tar.xz"
  version "0.17.0-dev.356+3140b375f"
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
