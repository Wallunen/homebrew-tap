class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260418-084117"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "8c830109fb69ff13140cc9026e61fe7e326ea79cf0bb87b290ad5bc5ebecb9c5"
    sha256 cellar: :any_skip_relocation, sequoia:      "0fbf4826a731b7ad4eec73f9909247fc342441ec17e3bad19e9b534106fd79fd"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "93b80f4817636e259b7311149517e48b4c25d779b60471113fb772bed3b98f24"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c01a49b5fc1fd4ee32d518fab1c22b8162b5a3cfb28071b75d7989d65b7d00ba" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "a924165f5ab4d70a12e60109fccabb1f61d2b8a16b5c8cdbc32450f4389f04f7" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "0b7617af16610f1d56ef12cbb96b8d4a1be349257d4b43cd1a30344eac204bcf" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.9+046002d1a.tar.xz"
  version "0.17.0-dev.9+046002d1a"
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
