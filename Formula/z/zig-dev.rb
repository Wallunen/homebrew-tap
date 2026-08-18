class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260818-082831"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "b702cceb4f0bbe3b39a18128a2ce855bcc9dca607b1a60a8a9c56dfa2e40fbd5"
    sha256 cellar: :any_skip_relocation, sequoia:      "535b8ee53fca635e0220d9d8266e0503e8630d685ec388a9789785f4dede9c05"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "31de69bc0154b2f2d410b24d613ea06d3c2553d930a87e71a3daff53c0ddd538"
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
