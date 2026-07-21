class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260721-020752"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "a5afb0127ce1657ef1df95b48791b14f36a0ad9aa20f9455d9fa16752db00721"
    sha256 cellar: :any_skip_relocation, sequoia:      "4f6194661bd60225a9c0e915ea5dc3796ed1d34d4b57036fee3b3900e3faf4a6"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5efdef5ecd91e04c4fd00e859dd3819452bd499d47c5527dba3a7c7f61de4036"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "b41f7b7ed076d84cb2f9794316f947017af26b27f5c11d5d5b735942612b4cc4" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4351e5c97daa1ae4eba6cf7df4d194b5f64c6d450886134b36b148a1ead70c7d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b9d2b068e4245b3de4b1e3acb43a214e46f366a7cbc77d573edc1425a4403cdd" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1441+d5181a9c9.tar.xz"
  version "0.17.0-dev.1441+d5181a9c9"
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
