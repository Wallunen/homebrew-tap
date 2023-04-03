class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "4df384da1906e438fbe2a153c7fa550573ce6eed56732939abbd0ccbc1a2d594" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "b1ece1292310c7e9747446f4f8829a0390ba96973323b88ffec0a71c20b4568f" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d1df5a3731aa9568daf0de2aede59f16de0dfb0db3fc6d5a4b0be5285ad10e55" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2371+a31450375.tar.xz"
  version "0.11.0-dev.2371+a31450375"
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
