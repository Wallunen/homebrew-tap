class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260803-174542"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "664e8277c5b1e76bd0ade814bf2bc3590c92e52721dab18e314be696a7aaa7cf"
    sha256 cellar: :any_skip_relocation, sequoia:      "1201e6135253320d6d3e62e5f89c4006c926835c248a248b34e8f49d81a43376"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "faa4eb0cb3176fe38f1ba1c2612c5305c492fdb6f8e1e1b9152722fe66682aa1"
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
