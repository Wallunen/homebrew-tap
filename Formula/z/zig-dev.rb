class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20261005-164229"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "858b3ffc3679bf8bca7353c0f1d49a1fd9361b3cde68b2c1347c00f9bcf76f6e"
    sha256 cellar: :any_skip_relocation, sequoia:      "60a18d032d6ecedb07b5acbd4c91a8af611f4e13dd36f014b12bdacd428f9d69"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "590de028ffdfe2559e9cef7d1baa2783c82e63c2d622d466e6a0b23ab57f7a7e"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c78829674f77bb75a5d4dec1d47fbe48b29e9c5eee695fce345f25767b68c539" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "f4220ef8e886871d343ed8c7c74fcb627e2d3f52d9f8042af35d4d10dc2e0091" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "2393d326510b7aed51b9559fe59a5c4b89b9ec089ba6a338c8bea5da37c583d4" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.18.0-dev.4+5a23bf4b2.tar.xz"
  version "0.18.0-dev.4+5a23bf4b2"
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
