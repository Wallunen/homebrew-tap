class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "1c8d06ea2b27eeec13391cd01410d89c18c222e788082ee2af063c2f7764707c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "b507525956b7f0c59e4328ba2a4eabe606a83a421bb6ca8b8419468a583785c5" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "62c7232a3d41e07dcfe568379e55247ad71cbc8f946c98f69709201da07855fd" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2232+84b89d7cf.tar.xz"
  version "0.11.0-dev.2232+84b89d7cf"
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
