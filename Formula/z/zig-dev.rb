class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "6b0e31361405576abfd4544bb704d0e74f7c4476df4765845dda74487c943dd8" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "55004bdbbfc1c1df40e56606b9c6044349d9b2a9e41ab6d7ae86a2ec5b56ad57" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "30303d81693b534519ff5f483d18642d07319bc0c51550f86da0845a6d912408" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2079+ba2d00663.tar.xz"
  version "0.14.0-dev.2079+ba2d00663"
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
