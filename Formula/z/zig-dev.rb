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
      sha256 "2f768f27561b1af4ad4720051f771f912f6b0284d856ee2f6aaa3fffc74a9304" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "db1ce237e0303233421e5b6be7c4c767844bb67077c1b7f605f626705ab43060" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d95fbbfc6c1cd2409c2c48f6f9ac54d249c4239f2202bc33d5001c660a80776f" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1811+6716bf52e.tar.xz"
  version "0.17.0-dev.1811+6716bf52e"
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
