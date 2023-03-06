class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "a357c5b35a0d247104bb727e4cfc902af66593b9b64018a725006e44d9ebafde" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "25e81932dd78f450a91c6b4f98a4ee070fb63cbc8f78354d580557c4640e453b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "cd5053539c16e3527f6dd4dc5a2e979c083fca5551d425156deced47869fd037" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.1862+e7f128c20.tar.xz"
  version "0.11.0-dev.1862+e7f128c20"
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
