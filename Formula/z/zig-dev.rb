class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260503-022811"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "57e3198d3569aa4d217f4b0800a9e6564d37b61dc1f4799b4a8105570a5f366e"
    sha256 cellar: :any_skip_relocation, sequoia:      "bc2052974a03c02abd0a0eee7144c5b4d6f7d7878c5345a7c92cd1975d28fb7a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d3fe63e95d954063e1d90498f1e37cf4a82ffc08fdc7f82590c5b8eb734a766e"
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
