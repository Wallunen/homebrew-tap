class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c5da1b96d36ea9250019bd4b5af2f467206c5f5e149d4e14c57523675a277b47" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "51287a9940ac34633895dc3ff58c18408eb346d81d9b6cb724a4988e29188394" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c9985f2af849505ba0b664793c6df8440891d133afb55d8c3231d25333c044fa" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3952+82a9d5d78.tar.xz"
  version "0.11.0-dev.3952+82a9d5d78"
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
