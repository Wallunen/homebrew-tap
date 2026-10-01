class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20261001-034220"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "3dfa5e9564ee0531e4810980e974fdbb70b5e046c5965a8fc42510d09539ed06"
    sha256 cellar: :any_skip_relocation, sequoia:      "8a49ce56d96eb780f08f2646916b648a80e59f80ed9a30fa609ab386438b1712"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "028aeed5ea232426196068256178ec1b0d5f2d8874311dd68bd68a0510e3ed91"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "3b60e1c0345578ee83e80c94646fd2615ddb13e64fa979b7bd5bd5d476072d1a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "251ef0c623e52896f7e946dc104ec752f0dee4f0a17e4dc56d9afbee939aaab2" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "f10e0586afb4a57912b92ec271f6cf5de5adb507635d53101c7b3a2713f9db27" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.2375+d8aab4878.tar.xz"
  version "0.17.0-dev.2375+d8aab4878"
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
