class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260817-083537"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "c598a2f67b78329634177630d78a8ae9c27b0ba26e6f12545601f366049b38cb"
    sha256 cellar: :any_skip_relocation, sequoia:      "6d57706f3d7b2b891501f5b5e1e34cdb72c800ebf72fe89cf8ca2c4f759aa1b2"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9fce025b99cb71ff5e713b95a4d74f8df7e3e30569f292b41aba760f4b231904"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "44b3a60b9e401bf8c8f582111f6844be711c20aba961833ba3f6df26883ce1d8" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "bd1fd490de61d8daed578433d482b1f40715bd3a03f7eab0cef8772d617135a5" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "842bfc37b6415941fa31a5344fed8d8209411e87c8643cd5edf15862c2593690" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1786+75044cb04.tar.xz"
  version "0.17.0-dev.1786+75044cb04"
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
