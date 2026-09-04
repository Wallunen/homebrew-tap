class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260904-184529"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "c89d6aa84dc769bb146ce64e38444854931ed03c970184528ab28d55ab6301a2"
    sha256 cellar: :any_skip_relocation, sequoia:      "e25fd1c618a7a5d679e55f4d2ce518486bd693caf732a3274efc7645756683aa"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3f00b61c2f62ef12976d0748fac742e546c9bed8e42359cb628c1a29056a1ff4"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e7679c126f2ec7c2d06c3bc61f952b8619e70dcf0303dde157c88c54bc152501" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "53f6d4a65fc98d145e532ce7cf1cf44ff7928891e451f44455b297b28ffb3c9b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "08d8e7cf715d26ce56164a2ecb9a8cc379c6955c524e8dc3dcb638f526f29b00" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1980+e78ea8f2c.tar.xz"
  version "0.17.0-dev.1980+e78ea8f2c"
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
