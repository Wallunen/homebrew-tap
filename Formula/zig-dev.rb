class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "a3bfd079e9c8892150cd8bfa327a8691ce3ee63d20520899ecdd9a0cbdf30c89" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "bc0e96c91b205ca7ecc0a1e6159a286c6e0bc6c4056ca84047353132d604bac7" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "6f9b2c499c352d22af9819ae19b8ec348b58427e87ea455a72f7b8a986478273" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1319+aecdf6ad5.tar.xz"
  version "0.12.0-dev.1319+aecdf6ad5"
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
