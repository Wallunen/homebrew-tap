class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "0409903042a7aceb30ecc1a20117d419da8956ec89a4d8d4e7bafed860f47d98" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "6d86bda1f2345531686c93b59b995f490d3b50b4ce3c97646c37a28c6c977b46" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "f1e9364136b8d32d705251c2e5b09ba8fab3a95417fe1d75ecbd8d944bffc7b4" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3433+640acf862.tar.xz"
  version "0.12.0-dev.3433+640acf862"
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
