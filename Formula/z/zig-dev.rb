class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260621-033524"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "f4ab3f58d25246bded42fe77dfb6a428a7c348e3eb7effb1370e911735cefb4b"
    sha256 cellar: :any_skip_relocation, sequoia:      "f21c9067bab4d257477352e4827acb747b7bcf8c034d61d415d80ca87aca7999"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "077ac4b4f1a20c8450de1b87ce26ec1e8999b7dc04aa8fa9e87ede20b2516329"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "db78d16e0eb6a1224b006ac4cdce2c5b9317953ca1dff50aa35ce8d27c258469" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "3eb3155861a9a3330b3056449537b818461f187557377622621b3ce3bed7a47e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "eab0b059fd4340f74afc2e60db86342bb9bc772250f1ba9c47aee7a0b7508f94" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.931+84f84267c.tar.xz"
  version "0.17.0-dev.931+84f84267c"
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
