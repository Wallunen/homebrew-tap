class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260427-022302"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "92bbd215a1b8c6f6693ed1b6b907d2b6f4cfe360276cc897c49aedd2039a83d3"
    sha256 cellar: :any_skip_relocation, sequoia:      "0bed6d4496dec25c9cb8cc353f80b03dfa41fb00f0c1960b118448671519a76f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c33438de983955606d883ce18e9e4e761edc45a74f386760157a76cab95da926"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "f2a386143fc1a30854d14a881debf5e312810f23d84b26e19c5c82909bb57958" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "b34f603f291eb25ca80c4d2233106d080ce8d39929cb0299977db614c7a0ac6e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e909c714463eb94386a1d8a965a353c81ff5f25a56a2d962c926c66be745e1bc" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.135+9df02121d.tar.xz"
  version "0.17.0-dev.135+9df02121d"
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
