class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260505-095716"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "346d3fb121195577992387ff41106da6464be5686db7a794c62caa0fc94ced31"
    sha256 cellar: :any_skip_relocation, sequoia:      "d8ff4ac19c2827f0e7bfa82187c68fb5b071a60917c40a35c17a90fb965631ed"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "598c486d938015e2f4f32f2a3e854400c7e4fd21bbe3d3747e2b9d2760a633d8"
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
