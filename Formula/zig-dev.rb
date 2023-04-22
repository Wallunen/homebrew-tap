class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "0b7e4edaeb7a01317864348be3f1ec5a5fce3f909af3271c60788e9eeaf64eb0" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "d70c03d4d4216f1556e2965ebb33fd112c3a663b1a3a0c3e7c101b9e50d8b592" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "bc553e5dac209cf48a8eba2a80c647f1f0e56e39c54b1ac6b71e17b2656a59ca" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2704+83970b6d9.tar.xz"
  version "0.11.0-dev.2704+83970b6d9"
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
