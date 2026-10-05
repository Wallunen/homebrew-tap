class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20261004-133710"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "d4a330c079a96fcc01b1cb9d66963f9b1ca4e363711aaa0e333a098a33214171"
    sha256 cellar: :any_skip_relocation, sequoia:      "1db33bf23cf59719a809a651e53ff677cba4ed611a33f9d72eadd14f7429665f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2f432d72d6ad3fc3215e7098d32d7128c91a34757a9cf4dc0ddbfc69f54dbfac"
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
