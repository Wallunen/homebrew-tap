class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260805-102852"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "c53711de38ac5a9f4b9826eb69b164e80420b5fccf10d716d9392f1a18a1c6f3"
    sha256 cellar: :any_skip_relocation, sequoia:      "29fe3f207cbc663b1326b2d0b379979e97489954a5a68541e0ae908b54205df0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a399a7f1b51cbfb6a907d92e5041e2a7ca63163292c79e1f3af6747c6dbe3ffe"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "cb78ba744950d6ff0d022469fe5a400c04c19e27c98b44d157c18e829b58eff3" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "d13865a4ee746c79d08fc1f9a1bd1a788c1423205ea5354403ad40d1386b7aed" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "bc92e8b99eeef771c744fe4173e7960bee7c06158d59779fa1e6ed795dccc6ac" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1564+97ced1272.tar.xz"
  version "0.17.0-dev.1564+97ced1272"
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
