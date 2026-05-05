class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260504-172536"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "35a5b75d5fa0cdca8d228a807194025f9d262fa430fc22280ac4f53cc6109d53"
    sha256 cellar: :any_skip_relocation, sequoia:      "19ade0eed46cd9a8401fb218cb4d16e4c284282beff789684a019fd988e6c060"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0b6d4a103dce688ad63bd542b2d7b67651873f57e3d6f188a1fde4a45363372e"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "860c1a7485c114de3e140c5ca0e9276872b60a5218d797a01cf2a2ba2438684b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "d7b965b5b5479f4759247aef56132919543eccc97a2be60002a4c684f33cbc98" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "6199ec7483d0a628cb3ebe4ff28ac0ac6cbc6d732a2b93a365312c4899cc526a" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.251+0db721ec2.tar.xz"
  version "0.17.0-dev.251+0db721ec2"
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
