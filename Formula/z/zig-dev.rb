class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260510-023104"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "27fb630644840eacec58dc0d2de86f076ea76c6db65ad8fcae15ec39261c4de2"
    sha256 cellar: :any_skip_relocation, sequoia:      "e8acee2cb2f1f6047208628e641711d1630a2c400a2f3f9aa9be9ab932d35244"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d259523aef98dc51a161c3850257cb4372a9236b04057ad0c2bf51add97046a1"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "f716e1eab0853cf84a9001fa35f6339d3792b4db5e4a6e0ac79d10b3a7e68da0" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "eba6ffe90d6932b49b81db452dc759cfdbbed59dd898b95331cbee7dcf261601" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "9def546ef6f470e47dd5da58490d1ecb075e42731cd8f8e0381bd95edfdb0918" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.292+fc1c83a36.tar.xz"
  version "0.17.0-dev.292+fc1c83a36"
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
