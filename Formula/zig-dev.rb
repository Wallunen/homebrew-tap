class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "540153607e7f8a8b6f6e25590b7b2b5d49b7f105b09ef1d1ea517012220d8799" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "f56d4e7ea6ff6fe20b1bf9b26163e6e69a42ede8f7d034ac66c0c0be3ecef281" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b9afc15d132a87a7d2e386e35174727b1f8f084c9072ea12b797cd7be0f43d95" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1303+8f4853369.tar.xz"
  version "0.12.0-dev.1303+8f4853369"
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
