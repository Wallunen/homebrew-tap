class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260522-024942"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "c3b1c1678c157fbb2873f83cdc6f840b29fb868986c3bfc0ced846c9e6d5b9a5"
    sha256 cellar: :any_skip_relocation, sequoia:      "1c54a4f283145fa313296cd63c0ef3c1a43d3fccac46abf9e4ab8c22fb1f8056"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "29647ec987571136cfff331006ac8feed5966feb40f904b6d6ce4227c389de6c"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "a8bc26077f06579b5a315597239beaf2df16a3bba5422cdfa6cfc5830fc8627c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "8874e12bfc3e541ed74f6a5c7b223592a4d7428162567055f6109153395d30ae" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "29581043bf739f894eb49d7741b563dcbcd964ad4bb2391f202de9291e2fcab4" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.315+5b647b792.tar.xz"
  version "0.17.0-dev.315+5b647b792"
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
