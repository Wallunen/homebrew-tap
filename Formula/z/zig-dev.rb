class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260804-103125"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "f6a85fb6b7d56c93dedd3729912bde791be05a7626ee1c5c3f1acd7f67e6c481"
    sha256 cellar: :any_skip_relocation, sequoia:      "6dfcbe9117996e227f28cae571d119c94d076df59fb868a38f75f96b38526d90"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f6f6040375b81dee6dbb51da3702b10738a70e685288f65662c97da078a931f1"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "5c22c061a95b2277ff1c2964a140432b230ad2ef89abddbe09a8c811988b232b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "7523163087e3e576b4833d0e3bdc8b51b25a41d38e7521337e79835ca7f574e0" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "2e5f9330a587f521264fe6a2930b1aa725843dcaac27809499573223098397ed" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1552+79dc16a0e.tar.xz"
  version "0.17.0-dev.1552+79dc16a0e"
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
