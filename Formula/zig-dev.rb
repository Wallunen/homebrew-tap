class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "f7aa337b0c521a8a83ebd5aade0bffbbfebc4a775b75a7ec610d550a2c27d138" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "eac7c9f9edd7e75c220d0c9b9d37ff5fdbb3bce1d20e4610ed6ea122f85635db" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "0637620e27c96592fe800b386bd9d97d2df5a2c0fab508703f0efe0f8a74997d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2925+88b3c1442.tar.xz"
  version "0.12.0-dev.2925+88b3c1442"
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
