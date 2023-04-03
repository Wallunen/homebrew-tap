class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e6da1d528836aac212b3d7399f991181a988cdb6892a6aa8f0627009fb79c0b3" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "b69f8d1224b97e5bc6ee4d89f9aa3d4366308927c55a35d3631addf6a66d9360" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "8ab27424d73f2ff02bf16718fdc7a2f4ab458887850550d8cccfeb248d8dba45" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2358+43a6384e9.tar.xz"
  version "0.11.0-dev.2358+43a6384e9"
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
