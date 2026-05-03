class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260502-021202"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "284c41fad41f60fc8718628e2d1b7da19d2bc663a6b8e1971c27e26fbd243c29"
    sha256 cellar: :any_skip_relocation, sequoia:      "519463e8148c09d1ee1917d842acd33c813263b9e7edb0c7e95fae19a48c9874"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "500206a574ff24303c739eaac2a11d8e12f3a6724239e7d7755c88675c0bea4d"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "f86125f8560a8335e5d92e4a6b6a03d4390a18879d49986ae0417a6a7ba36abf" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "519c0faac73b07b31d6af3f204c65daf20f26184450266d2f5fa727583a8062f" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "cb86a34717f6227d9c6989315a493e996117323053051489394cef4edc8444d6" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.228+ce198b7c2.tar.xz"
  version "0.17.0-dev.228+ce198b7c2"
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
