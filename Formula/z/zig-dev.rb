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
      sha256 "381dc097ce82d9b9ff1601f066b764e17b8c1cf2a43758698b884ea5a091a33b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "1081c58db11bd2a82119caff81d8bdf168c9e49728f269cac2acd0bb58623d17" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "86dc1a2212fb951f7389a067e5c660893513f688ee794b4c450452e6d05dd0e1" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.256+04481c76c.tar.xz"
  version "0.17.0-dev.256+04481c76c"
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
