class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260819-082943"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "3f6fdc4e8e0cb9cb824f578d56fe508e014e6129bc3a294d362747b2fe6db559"
    sha256 cellar: :any_skip_relocation, sequoia:      "5f8e86b8dd866bcd8cdb936b00852ab4d7b4b973433f6354e8b1937a58993a18"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "30ccfdef357a1c29535e83188f30b3a2ec4f6cb863e3ac1f4ceb472fa84ad607"
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
